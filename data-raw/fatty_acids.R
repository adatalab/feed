
fatty_acids <- list()

SFA <- janitor::clean_names(SFA)
UFA <- janitor::clean_names(UFA)

fatty_acids[[1]] <- SFA
fatty_acids[[2]] <- UFA

names(fatty_acids) <- c("saturated", "unsaturated")

fatty_acids

devtools::use_data(fatty_acids)
