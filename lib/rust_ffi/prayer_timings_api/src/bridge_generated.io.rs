use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_get_prayer_timings(
    port_: i64,
    lat: f64,
    lon: f64,
    day: u32,
    month: u32,
    year: i32,
    madhab: i32,
    method: i32,
) {
    wire_get_prayer_timings_impl(port_, lat, lon, day, month, year, madhab, method)
}

#[no_mangle]
pub extern "C" fn wire_get_calculated_hijri_date(port_: i64, day: u32, month: u32, year: i32) {
    wire_get_calculated_hijri_date_impl(port_, day, month, year)
}

#[no_mangle]
pub extern "C" fn wire_get_qiblah_angle_from_north(port_: i64, lat: f64, lon: f64) {
    wire_get_qiblah_angle_from_north_impl(port_, lat, lon)
}

// Section: allocate functions

// Section: impl Wire2Api

// Section: wire structs

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturnStruct(val: support::WireSyncReturnStruct) {
    unsafe {
        let _ = support::vec_from_leak_ptr(val.ptr, val.len);
    }
}
