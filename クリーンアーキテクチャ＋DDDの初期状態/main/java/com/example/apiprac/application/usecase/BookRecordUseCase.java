package com.example.apiprac.application.usecase;
import java.util.List;

import com.example.apiprac.application.command.BookRecordItem;
import com.example.apiprac.application.command.ResisterCommand;
/**
 * 具体的なユースケース（入力コマンド＋実行）を記述
 */
public interface BookRecordUseCase {
	// UC1: 読んだ本を登録できる
	void resistBook(ResisterCommand cmd);
	// UC2: 読んだ本の一覧を取得できる
	List<BookRecordItem> findAllBooks();
}