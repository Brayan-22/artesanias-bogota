package dev.alejandro.paymentservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductosRequestDto {
    private String idProducto;
    private Long cantidadProducto;
    private Long precioIndividual;
}
