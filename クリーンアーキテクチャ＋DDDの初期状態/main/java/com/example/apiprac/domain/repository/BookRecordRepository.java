package com.example.apiprac.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.apiprac.domain.model.BookRecord;

public interface BookRecordRepository extends JpaRepository<BookRecord, Integer>{
	// UC1: 読んだ本を登録できる(SVO)
	//void resist(BookRecord bookRecord);
	// UC2: 読んだ本の一覧を取得できる
	//List<BookRecord> getBooks();
}
