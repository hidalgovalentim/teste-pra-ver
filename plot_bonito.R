

p <-ggplot(Inventories_processado, aes(x = Ano_Inventario)) +
  geom_histogram(aes(fill = TaxGroup), alpha = 0.3, binwidth = 3, color = "black", size = 0.2) +
  geom_vline(data = medias_por_grupo, 
             aes(xintercept = Media_Ano),
             linetype = "dashed", linewidth = 0.6, color = "#2a2a2a", alpha = 0.8) +
  geom_label(data = medias_por_grupo,  # Mudei de geom_text para geom_label
             aes(x = Media_Ano, y = Inf, label = Media_Ano),  # Removi o round() já que são inteiros
             vjust = 1.5, hjust = 0.5, size = 2.5, color = "#2a2a2a", fontface = "bold",
             fill = "white", label.size = 0.2, label.padding = unit(0.15, "lines")) +  # Caixinha branca
  scale_fill_viridis_d() +
  scale_color_viridis_d() +
  scale_x_continuous(breaks = seq(1970, 2016, by = 10)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  facet_wrap(~TaxGroup, scales = "free_y") +
  labs(
    x = "Distribution of inventory years by taxonomic group",  # Título no eixo X
    y = "Frequency",
    title = ""  # Removi o título geral pois coloquei no eixo X
  ) +
  theme_minimal(base_family = "sans") +
  theme(
    legend.position = "none",
    panel.spacing = unit(0.5, "lines"),
    strip.background = element_rect(fill = "#f7f7f7", color = "#e1e1e1", linewidth = 0.5),
    strip.text = element_text(size = 9, face = "bold", color = "#2a2a2a", margin = margin(5, 0, 5, 0)),
    panel.grid.major = element_line(color = "#f0f0f0", linewidth = 0.3),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text.x = element_text(size = 8, color = "#666666", angle = 0),
    axis.text.y = element_text(size = 11, color = "#666666"),
    axis.title.y = element_text(size = 11, face = "bold", color = "#2a2a2a", margin = margin(0, 10, 0, 0)),
    axis.title.x = element_text(size = 11, face = "bold", color = "#2a2a2a",  # Estilo para o eixo X
                                margin = margin(10, 0, 0, 0), hjust = 0.5),
    plot.title = element_blank(),  # Remove o título
    plot.margin = margin(20, 20, 20, 20)
  )

ggsave(filename = "C:/Users/USUARIO DELL/OneDrive/Tese_Hidalgo/Outputs/histograma.png",
       plot = p,
       width = 15, height = 10, units = "cm",
       dpi = 600) 

