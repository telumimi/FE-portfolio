package com.example.apiprac.application.command;
import java.time.LocalDate;

import lombok.Data;
/**
 * UC2を達成するのに必要なDTO
 */
@Data
public class BookRecordItem {
	private String title;
	private LocalDate start;
	private LocalDate end;
}