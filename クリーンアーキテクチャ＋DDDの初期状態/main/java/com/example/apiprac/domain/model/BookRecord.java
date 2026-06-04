package com.example.apiprac.domain.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "book_records") // テーブル定義書から調べる
@Data
public class BookRecord {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String isbn;
	private String title;
	@Column(name = "start_day")
	private LocalDate startDay;
	@Column(name = "end_day")
	private LocalDate endDay;
}