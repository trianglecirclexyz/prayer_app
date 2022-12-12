
use salah::prelude::*;

// TODO add HighAltitudeRule as parameter to 
// get_prayer_timings

pub fn get_prayer_timings(
        lat: f64, 
        lon: f64, 
        day: u32, 
        month: u32, 
        year: i32,
        madhab: i32,
        method: i32
    ) -> String {

        let _date = Utc.ymd(year, month, day);
        let _coordinates = Coordinates::new(lat, lon);

        let mut _madhab = Madhab::Shafi;
        match madhab {
            0 => _madhab = Madhab::Shafi,
            1 => _madhab = Madhab::Hanafi,
            _ => ()
        }

        let mut _method = Method::NorthAmerica;
        match method {
            0 => _method = Method::MuslimWorldLeague,
            1 => _method = Method::Egyptian,
            2 => _method = Method::Karachi,
            3 => _method = Method::UmmAlQura,
            4 => _method = Method::Dubai,
            5 => _method = Method::MoonsightingCommittee,
            6 => _method = Method::NorthAmerica,
            7 => _method = Method::Kuwait,
            8 => _method = Method::Qatar,
            9 => _method = Method::Singapore,
            _ => ()
        }

        let _params = Configuration::with(_method, _madhab);

        let _prayer_timings = PrayerSchedule::new()
            .on(_date)
            .for_location(_coordinates)
            .with_configuration(_params)
            .calculate();

        let mut formatted_prayer_timings: String = "".to_string();
        match _prayer_timings {
            Ok(prayer) => {
                formatted_prayer_timings = format!("{}\n{}\n{}\n{}\n{}\n{}\n{}", 
                    (DateTime::from(prayer.time(Prayer::Fajr)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::Sunrise)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::Dhuhr)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::Asr)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::Maghrib)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::Isha)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                    (DateTime::from(prayer.time(Prayer::FajrTomorrow)) 
                        as DateTime<Local>).format("%Y-%m-%d %H:%M:%S")
                        .to_string(),
                );
            },
            Err(error) => println!("Could not calculate prayer times: {}", error)
        }

        formatted_prayer_timings

    }
    
    
pub fn get_calculated_hijri_date(
        day: u32, 
        month: u32, 
        year: i32,
    ) -> String {

        // kuwaiti algorithm implementation 
        // (inaccurate, use external API to get observed date via moonsighting)
        let mut _tmp_day = day as f64;
        let mut _tmp_month = month as f64;
        let mut _tmp_year = year as f64;

        let mut m = month + 1;
        let mut y = year;
        if m < 3 {
            y -= 1;
            m += 12;
        }

        let mut a = ((y as f64)/100.0).floor();
        let mut b = (2 as f64) - a + (a/4.0).floor();
        if y < 1583 {
            b = 0.0;
        }
        if y == 1583 {
            if m > 10 {
                b = -10.0;
            }
            if m == 10 {
                b = 0.0;
                if day > 4 {
                    b = -10.0;
                }
            }
        }

        let jd = (365.25 * ((y as f64) + 4716.0)).floor()
            + (30.6001 * ((m as f64)+1.0)).floor() + b 
            + (day as f64) - (1524 as f64);

        b = 0.0;
        if jd > 2299160.0 {
            a = ((jd - 1867216.25)/36524.25).floor();
            b = 1.0 + a - (a/4.0).floor();
        }
        let bb = jd + b + 1524.0;
        let mut cc = ((bb - 122.1)/365.25).floor();
        let dd = (365.25 * cc).floor();
        let ee = ((bb - dd)/30.6001).floor();
        _tmp_day = (bb - dd) - (30.6001 * ee).floor();
        _tmp_month = ee - 1.0;
        if ee > 13.0 {
            cc += 1.0;
            _tmp_month = ee - 13.0;
        }
        _tmp_year = cc - 4716.0;

        let iyear = 10631.0/30.0;
        let epochastro = 1948084.0;
        // let epochcivil = 1948085.0;

        let shift1 = 8.01/60.0;

        let mut z = jd - epochastro;
        let cyc = (z/10631.0).floor();
        z = z - 10631.0 * cyc;
        let j = ((z - shift1)/iyear).floor();
        let iy = 30.0 * cyc + j;
        z = z - (j * iyear + shift1).floor();
        let mut im = ((z + 28.5001)/29.5).floor();
        if im == 13.0 {
            im = 12.0;
        }
        let id = z - (29.5001 * im - 29.0).floor();

        let hijri_day = id as u32;
        let hijri_month = (im - 1.0) as u32;
        let hijri_year = iy as u32;
        
        let mut formatted_hijri_date: String = "".to_string();
        match hijri_month {
            1 => formatted_hijri_date = "Muharram".to_string(),
            2 => formatted_hijri_date = "Safar".to_string(),
            3 => formatted_hijri_date = "Rabi' al-Awwal".to_string(),
            4 => formatted_hijri_date = "Rabi' al-Thani".to_string(),
            5 => formatted_hijri_date = "Jumada al-Awwal".to_string(),
            6 => formatted_hijri_date = "Jumada al-Thani".to_string(),
            7 => formatted_hijri_date = "Rajab".to_string(),
            8 => formatted_hijri_date = "Sha'aban".to_string(),
            9 => formatted_hijri_date = "Ramadan".to_string(),
            10 => formatted_hijri_date = "Shawwal".to_string(),
            11 => formatted_hijri_date = "Dhu al-Qi'dah".to_string(),
            12 => formatted_hijri_date = "Dhu al-Hijjah".to_string(),
            _ => ()
        }
        formatted_hijri_date = format!("{} {}, {} AH", 
            formatted_hijri_date, hijri_day, hijri_year);

        
        formatted_hijri_date

    }

pub fn get_qiblah_angle_from_north(
        lat: f64,
        lon: f64
    ) -> f64 {

        let _coordinates = Coordinates::new(lat, lon);
        let qiblah_angle = Qiblah::new(_coordinates);

        qiblah_angle.0

    }