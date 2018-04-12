#include "script_Component.hpp"

PREP(addToList);
PREP(BlackList);
PREP(countBalance);
PREP(HandlePFH);
PREP(UpdateBalance);

GVAR(ForceRebalance) = false;
GVAR(HeadlessList) = [];
GVAR(Transfered) = [];
GVAR(ToTransfer) = [];
GVAR(groupsTransfered) = [];
