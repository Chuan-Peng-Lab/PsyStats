
if (!requireNamespace("pacman", quietly = TRUE)) {
      # 如果未安装，则安装包
      install.packages("pacman")
}

# load patchwork and tidyverse using pacman::p_load
pacman::p_load("tidyverse", "patchwork")

# 生成一组数据
x1 <- seq(60, 140, length = 100)

y1 <- dnorm(x1, mean = 100, sd = 15)

# 将数据转化为数据框
df <- data.frame(x1, y1)

# 绘制三条正态分布曲线
p1 <- ggplot(df) + 
      geom_line(aes(x1, y1), 
                color = "#56B4E9", 
                size = 1) +
      labs(title = "总体", 
           x = "x", 
           y = "密度") +
      scale_x_continuous(breaks = seq(50, 150, 20))+
      theme_classic()

# 生成100个满足正态分布的数据点
x2 <- data.frame(x = rnorm(n = 100, mean = 100, sd = 15)) 

p2 <- ggplot(x2, aes(x = x)) +
      geom_histogram() + 
      labs(title = "n=100", 
           x = "x", 
           y = "计数") + 
      scale_x_continuous(breaks = seq(50, 150, 20)) +
      theme_classic()

# patch the figures
p1+p2