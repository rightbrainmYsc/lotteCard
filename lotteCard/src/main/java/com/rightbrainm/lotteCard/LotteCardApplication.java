package com.rightbrainm.lotteCard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class LotteCardApplication extends SpringBootServletInitializer {

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {

		return application.sources(LotteCardApplication.class);
	}


	public static void main(String[] args) throws Exception {

		SpringApplication.run(LotteCardApplication.class, args);
	}
}
