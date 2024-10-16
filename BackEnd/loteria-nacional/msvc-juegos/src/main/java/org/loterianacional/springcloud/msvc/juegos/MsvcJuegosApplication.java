package org.loterianacional.springcloud.msvc.juegos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class MsvcJuegosApplication {

	public static void main(String[] args) {
		SpringApplication.run(MsvcJuegosApplication.class, args);
	}

}
