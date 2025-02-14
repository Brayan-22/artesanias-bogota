package dev.alejandro.paymentservice.controller;

import dev.alejandro.paymentservice.dto.PaymentIntentRequestDto;
import dev.alejandro.paymentservice.services.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class PaymentController {


    private final PaymentService paymentService;

    @PostMapping("/payment-intent")
    public ResponseEntity<Map<String,String>> createPaymentIntent(@RequestBody PaymentIntentRequestDto requestDto){
        return ResponseEntity.ok(paymentService.paymentIntent(requestDto));
    }

    @PatchMapping("/payment-intents/{paymentIntentId}")
    public ResponseEntity<Map<String,String>> updatePaymentIntent(
            @PathVariable String paymentIntentId,
            @RequestBody PaymentIntentRequestDto requestDto
    ){
        return ResponseEntity.ok(paymentService.updatePaymentIntent(paymentIntentId,requestDto));
    }



}
