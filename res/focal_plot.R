library(tidyverse)

p=seq(0.01, 1.0, 0.01)

ds = bind_rows(tibble(Error=p, Loss = -log(1-p), Function="Cross entropy"),
	       tibble(Error=p, Loss = -p * log(1-p), Function="Focal loss"))

ggplot(ds, aes(x=Error, y=Loss, color=Function)) +
	geom_rect(xmin=0.0, xmax=0.5, ymin=0, ymax=4.5, fill="grey", color="grey") +
	geom_text(x = 0.25, y = 0.8, label="well-classified examples", color="black", size=3) +
	geom_line() + xlab("Prediction error")
ggsave(filename = "focal_loss.svg", width = 5, height = 3)

