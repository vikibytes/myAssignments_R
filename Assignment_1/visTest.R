library(ggvis)
data("iris")
iris %>%
  ggvis(x = ~Sepal.Length, y = ~Petal.Length) %>%
  layer_smooths() %>%
  layer_points() %>%
  layer_smooths(span = 0.3, stroke := "red") %>%
  layer_model_predictions(model = "lm", stroke := "green") %>%
  layer_model_predictions(model = "lm", stroke := "green", se=T)
