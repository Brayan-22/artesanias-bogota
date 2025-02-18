package dev.alejandro.paymentservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentIntentRequestDto {
    List<ProductosRequestDto> productos;
    private Long totalAmount;
    private String currency;
}
