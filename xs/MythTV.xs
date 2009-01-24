#include "perlmyth.h"

MODULE = Net::MythTV  PACKAGE = Net::MythTV

BOOT:
#include "register.xsh"
#include "boot.xsh"
