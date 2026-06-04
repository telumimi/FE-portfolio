package com.example.apiprac.application.command;
import java.time.LocalDate;

import lombok.Data;
/**
 * UC1を達成するのに必要な入力コマンド
 */
@Data
public class ResisterCommand {
	private String isbn;
	private String title;
	private LocalDate start;
	private LocalDate end;
}