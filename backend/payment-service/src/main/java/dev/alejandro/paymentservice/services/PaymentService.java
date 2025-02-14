package dev.alejandro.paymentservice.services;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import com.stripe.param.PaymentIntentUpdateParams;
import dev.alejandro.paymentservice.dto.PaymentIntentRequestDto;
import dev.alejandro.paymentservice.dto.ProductosRequestDto;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@RefreshScope
public class PaymentService {
    @Value("${app.stripe.secret-key}")
    private String stripeSecretKey;

    private Stripe stripe;

    @PostConstruct
    public void pay() {
        Stripe.apiKey = stripeSecretKey;
    }
    private Long calculateTotalAmount(List<ProductosRequestDto> productos) {
        return productos.stream()
                .mapToLong(p -> p.getPrecioIndividual() * p.getCantidadProducto())
                .sum();
    }

    public Map<String,String> paymentIntent(PaymentIntentRequestDto requestDto)throws RuntimeException {
        if (calculateTotalAmount(requestDto.getProductos()) != requestDto.getTotalAmount()){
            throw new RuntimeException("El monto no coincide con el precio de los productos");
        }
        try{
            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(requestDto.getTotalAmount())
                    .setCurrency(requestDto.getCurrency())
                    .build();
            PaymentIntent paymentIntent = PaymentIntent.create(params);
            Map<String,String> response = new HashMap<>();
            response.put("client_secret",paymentIntent.getClientSecret());
            response.put("payment_intent_id",paymentIntent.getId());
            return response;
        }catch (StripeException e){
           throw new RuntimeException(e.getMessage());
        }
    }

    public Map<String, String> updatePaymentIntent(String paymentIntentId, PaymentIntentRequestDto requestDto)throws RuntimeException {
        if (calculateTotalAmount(requestDto.getProductos()) != requestDto.getTotalAmount()){
            throw new RuntimeException("El monto no coincide con el precio de los productos");
        }
        try{
            PaymentIntentUpdateParams params = PaymentIntentUpdateParams.builder()
                    .setAmount(requestDto.getTotalAmount())
                    .setCurrency(requestDto.getCurrency())
                    .build();
            PaymentIntent paymentIntent = PaymentIntent.retrieve(paymentIntentId);
            paymentIntent = paymentIntent.update(params);
            Map<String,String> response = new HashMap<>();
            response.put("client_secret",paymentIntent.getClientSecret());
            return response;
        }catch (StripeException e){
            throw new RuntimeException(e.getMessage());
        }
    }
}
