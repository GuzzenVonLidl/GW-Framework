#include "scriptComponent.hpp"

PREP(addHC);
PREP(BlackList);
PREP(countBalance);
PREP(HandlePFH);
PREP(transferer);
PREP(UpdateBalance);

GVAR(ForceRebalance) = false;
GVAR(HeadlessList) = [];
GVAR(Transfered) = [];
GVAR(ToTransfer) = [];
