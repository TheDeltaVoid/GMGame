function approach(a, b, amt) {
    return (a < b) ? min(a + amt, b) : max(a - amt, b);
}
