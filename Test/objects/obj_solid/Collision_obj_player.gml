// Push player out if overlapping
if (place_meeting(other.x, other.y, id)) {
    while (place_meeting(other.x, other.y, id)) {
        other.y -= 1; // Move up until free
    }
    other.vsp = 0; // Stop vertical movement
}