function check_on_platform() {
    var plat = instance_place(x, y + 1, oPlatform);
    return (plat != noone && bbox_bottom <= plat.bbox_top + 2);
}
