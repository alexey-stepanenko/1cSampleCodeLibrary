
#Область Раскраска

// Возвращается строка CSS
//
// Возвращаемое значение:
//   Строка CSS
//
Функция ВернутьСтиль()
	
	Возврат
		"pre
		|{
		|   font-family: Courier New;
		|   color: #0000FF;
		|   font-size: 10pt;
		|}
		|<!-- Ключевое слово -->
		|.k
		|{
		|	color: red;
		|}
		|<!-- Комментарий -->
		|.c
		|{
		|	color: green;
		|}
		|<!-- Строка -->
		|.s
		|{
		|	color: black;
		|}
		|<!-- Число -->
		|.n
		|{
		|	color: black;
		|}
		|<!-- Препроцессор -->
		|.p
		|{
		|	color: brown;
		|}"
		
КонецФункции

// Процедура раскраски токена
//
// Параметры:
//   СтрокаКода - Текущая строка кода
//   Токен      - Токен, который окрашивается
//   Поз        - Позиция начала Токена в текущей строке
//   Класс      - Класс, к которому принадлежит токен
//
Процедура РаскрашиваемТокен(СтрокаКода, Токен, Поз, Класс)
	
	ДлинаТокена = СтрДлина(Токен);
	
	СтрокаКода = Лев(СтрокаКода, Поз - ДлинаТокена) + 
				"<span class=" + Класс + ">" + 
				Сред(СтрокаКода, Поз - ДлинаТокена + 1, ДлинаТокена) +
				"</span>" + 
				Прав(СтрокаКода, СтрДлина(СтрокаКода) - Поз);
	Поз = Поз + СтрДлина("<span class=>" + "</span>" + Класс);
	
КонецПроцедуры

// Проверяется символ на принадлежность к специальным символам
//
// Параметры:
//   _Символ - Проверяемый символ
//
// Возвращаемое значение:
//   Истина, если _Символ является специальным символом, Ложь - не является.
//
Функция ЭтоСпецСимволы(_Символ)
	
	Символ = НРег(_Символ);
	Если Символ = ")" Или 
    	 Символ = "(" Или
		 Символ = "[" Или
		 Символ = "]" Или
		 Символ = "." Или
		 Символ = "," Или
		 Символ = "=" Или
		 Символ = "+" Или
		 Символ = "-" Или
		 Символ = "<" Или
		 Символ = ">" Или
		 Символ = ";" Или
		 Символ = "?" Или
		 Символ = "*" 
	Тогда
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
	
КонецФункции

// Токен проверяется на принадлежность к ключевым словам встроенного языка
//
// Параметры:
//   _Токен - проверяемый токен
//
// Возвращаемое значение:
//   Истина, если токен является ключевым словом встроенного языка, Ложь - не является.
//
Функция ЭтоКлючевоеСлово(_Токен)
	
	Токен = НРег(_Токен);
	Если 
		Токен = "if" Или
		Токен = "если" Или
		Токен = "then" Или
		Токен = "тогда" Или
		Токен = "elsif" Или
		Токен = "иначеесли" Или
		Токен = "else" Или
		Токен = "иначе" Или
		Токен = "endif" Или
		Токен = "конецесли" Или
		Токен = "do" Или
		Токен = "цикл" Или
		Токен = "for" Или
		Токен = "для" Или
		Токен = "to" Или
		Токен = "по" Или
		Токен = "each" Или
		Токен = "каждого" Или
		Токен = "in" Или
		Токен = "из" Или
		Токен = "while" Или
		Токен = "пока" Или
		Токен = "endDo" Или
		Токен = "конеццикла" Или
		Токен = "procedure" Или
		Токен = "процедура" Или
		Токен = "endprocedure" Или
		Токен = "конецпроцедуры" Или
		Токен = "function" Или
		Токен = "функция" Или
		Токен = "endfunction" Или
		Токен = "конецфункции" Или
		Токен = "var" Или
		Токен = "перем" Или
		Токен = "export" Или
		Токен = "экспорт" Или
		Токен = "goto" Или
		Токен = "перейти" Или
		Токен = "and" Или
		Токен = "и" Или
		Токен = "or" Или
		Токен = "или" Или
		Токен = "not" Или
		Токен = "не" Или
		Токен = "val" Или
		Токен = "знач" Или
		Токен = "break" Или
		Токен = "прервать" Или
		Токен = "continue" Или
		Токен = "продолжить" Или
		Токен = "return" Или
		Токен = "возврат" Или
		Токен = "try" Или
		Токен = "попытка" Или
		Токен = "except" Или
		Токен = "исключение" Или
		Токен = "endTry" Или
		Токен = "конецпопытки" Или
		Токен = "raise" Или
		Токен = "вызватьисключение" Или
		Токен = "false" Или
		Токен = "ложь" Или
		Токен = "true" Или
		Токен = "истина" Или
		Токен = "undefined" Или
		Токен = "неопределено" Или
		Токен = "null" Или
		Токен = "new" Или
		Токен = "новый" Или
		Токен = "execute" Или
		Токен = "выполнить"
	Тогда
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;

КонецФункции

// Функция получения символа из строки в заданной позиции
// 
// Параметры:
//   Строка - Строка, из которой берется символ
//   Поз    - Позиция получаемого символа в строке
//
// Возвращаемое значение:
//   Символ из запрашиваемой позиции
//
Функция ПолучитьСимвол(Строка, Поз)
	
	Возврат Сред(Строка, Поз, 1);
	
КонецФункции

// Основная функция раскрашивания кода
// 
// Параметры:
//   СтрокаКода - Раскрашивание происходит построчно, этот параметр - текущая строка
//
// Возвращаемое значение:
//   СтрокаКода - раскрашенная строка кода
//
Функция РаскрашиваемКод(СтрокаКода)
	
	Поз = 1;
	Состояние = 0;                                   
	Токен = "";
	НачалоСтроки = 1;
	
	// Последовательно перебираются все символы строки кода
	Пока Поз <> СтрДлина(СтрокаКода) + 1 Цикл
		
		ТекущийСимвол = ПолучитьСимвол(СтрокаКода, Поз);
		Если ТекущийСимвол = "/" Тогда             
			Состояние = 1;
		ИначеЕсли ТекущийСимвол = Символы.Таб Или
				  ТекущийСимвол = " " Тогда
			Состояние = 2;
		ИначеЕсли ТекущийСимвол = """" Тогда
			Состояние = 3;
		ИначеЕсли ТекущийСимвол = "" Тогда
			Состояние = 5;
		ИначеЕсли ЭтоСпецСимволы(ТекущийСимвол) Тогда
			Состояние = 6;
		ИначеЕсли ТекущийСимвол = "#" Или ТекущийСимвол = "&" Тогда
			Состояние = 8;
		Иначе
			Состояние = 4; 
		КонецЕсли;
		
		// Проверяется на комментарий или на символ деления
		Если Состояние = 1 Тогда
			Если Не ВСтроке Тогда 
				Если ПолучитьСимвол(СтрокаКода, Поз + 1) = "/" Тогда
					// Окрашиваем комментарий
					СтрокаКода = Лев(СтрокаКода, Поз - 1) + 
								"<span class=c>" + 
								Прав(СтрокаКода, СтрДлина(СтрокаКода) - Поз + 1) +
								"</span>";
					Возврат СтрокаКода;
				Иначе
					// Это символ деления
					РаскрашиваемТокен(СтрокаКода, ТекущийСимвол, Поз, "k");
					Токен = "";
				КонецЕсли;
			КонецЕсли;
		// Операции при встрече символа табуляции или пробела
		ИначеЕсли Состояние = 2 Тогда
			Если Не ВСтроке Тогда 
				Если Не ПустаяСтрока(Токен) Тогда
					Поз = Поз - 1;
					// Пробел после после токена, значит
					// токен - ключевое слово...
					Если ЭтоКлючевоеСлово(Токен) Тогда
						РаскрашиваемТокен(СтрокаКода, Токен, Поз, "k");
					Иначе
					// ... или число
						Попытка
							ч = Число(Токен);
							РаскрашиваемТокен(СтрокаКода, Токен, Поз, "n");
						Исключение
						КонецПопытки;
					КонецЕсли;
					Поз = Поз + 1;
					Токен = "";
				КонецЕсли;
			КонецЕсли;
		// Операции встрече символа "кавычка"
		ИначеЕсли Состояние = 3 Тогда
			// Нашли парную кавычку - окрашиваем как строку
			Если ВСтроке Тогда
				СтрокаКода = Лев(СтрокаКода, НачалоСтроки - 1) + 
							"<span class=s>" + 
							Сред(СтрокаКода, НачалоСтроки, Поз - НачалоСтроки + 1) +
							"</span>" +
							Прав(СтрокаКода, СтрДлина(СтрокаКода) - Поз);
				Поз = Поз + СтрДлина("<span class=s>" + "</span>");
				ВСтроке = Ложь;
				Токен = "";
			// Первая кавычка, запоминаем позицию и взводим флаг нахождения в строке
			Иначе
				НачалоСтроки = Поз;
				ВСтроке = Истина;
			КонецЕсли;
		// Встретился один из специальных символов
		ИначеЕсли Состояние = 6 Тогда
			Если Не ВСтроке Тогда 
				Если Не ПустаяСтрока(Токен) Тогда
					Поз = Поз - 1;
					// Дабы избежать окраски метода объекта с совпадающим
					// именем с одним из ключевых слов, проверяем текущий символ
					// на "."
					Если ЭтоКлючевоеСлово(Токен) и ТекущийСимвол <> "." Тогда
						РаскрашиваемТокен(СтрокаКода, Токен, Поз, "k");
					Иначе
						// Не ключевое слово - значит число
						Попытка
							ч = Число(Токен);
							РаскрашиваемТокен(СтрокаКода, Токен, Поз, "n");
						Исключение
						КонецПопытки;
					КонецЕсли;
					Поз = Поз + 1;
					Токен = "";
				КонецЕсли;
				// Один из специальных символов
				РаскрашиваемТокен(СтрокаКода, ТекущийСимвол, Поз, "k");
			КонецЕсли;
		// Встретился символ препроцессора
		ИначеЕсли Состояние = 8 Тогда
			Если Не ВСтроке Тогда 
				Поз = СтрДлина(СтрокаКода);
				РаскрашиваемТокен(СтрокаКода, СтрокаКода, Поз, "p");
			КонецЕсли;
		// Остальные символы
		ИначеЕсли Состояние = 4 Тогда
			Токен = Токен + ТекущийСимвол;
		// Конец
		ИначеЕсли Состояние = 5 Тогда
			Прервать;
		КонецЕсли;
		
		Поз = Поз + 1;
	КонецЦикла;                                   
	
	// Многострочная строка
	Если ВСтроке Тогда
		СтрокаКода = Лев(СтрокаКода, НачалоСтроки - 1) + 
					"<span class=s>" + 
					Сред(СтрокаКода, НачалоСтроки, Поз - НачалоСтроки + 1) +
					"</span>" +
					Прав(СтрокаКода, СтрДлина(СтрокаКода) - Поз);
		Поз = Поз + СтрДлина("<span class=s>" + "</span>");
		Токен = "";
	КонецЕсли;
	
	// Анализируем последний токен строки кода
	Если Не ПустаяСтрока(Токен) Тогда
		Если ЭтоКлючевоеСлово(Токен) Тогда
			Поз = Поз - 1;
			РаскрашиваемТокен(СтрокаКода, Токен, Поз, "k");
			Поз = Поз + 1;
		КонецЕсли;
	КонецЕсли;
	
	Возврат СтрокаКода;
	
КонецФункции

// Функция последовательно перебирает все строки переданного кода
// 
// Параметры:
//   Код - Код, который подлежит окраске
//
// Возвращаемое значение:
//   Буфер - Окрашенный код, заключенный в тег <pre>
//
Функция РаскрашиваемТекст(Код)
	
	Буфер = "<pre>";
	
	// Последовательно перебираются все строки кода, окрашиваются
	// и записываются в буфер
	Для счт = 1 По СтрЧислоСтрок(Код) Цикл
										
		стр = СтрПолучитьСтроку(Код, счт);
		Буфер = Буфер + РаскрашиваемКод(стр) + Символы.ПС;
										
	КонецЦикла;
	
	Возврат Буфер + "</pre>";
	
КонецФункции

// Процедура раскрашивания текста
// 
Процедура РаскраситьТекст(Текст)
	
	Попытка
		
		РаскрашенныйТекст = РаскрашиваемТекст(Текст);
		
		НоваяСтрока = ТаблицаКоманд.Добавить();
		НоваяСтрока.Команда = "РаскрашиваемТекст";
		НоваяСтрока.РаскрашенныйТекст = РаскрашенныйТекст;
		
	Исключение          
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
	
КонецПроцедуры

// Процедура изменения стиля HTML документа
// 
Процедура ИзменитьСтили()
	
	НоваяСтрока = ТаблицаКоманд.Добавить();
	НоваяСтрока.Команда = "ИзменитьСтили";
	
КонецПроцедуры

// Обработчик события ДокументСформирован
//
&НаКлиенте
Процедура ПолеHTMLДокументаДокументСформирован(Элемент)
	
	Пока ТаблицаКоманд.Количество() > 0 Цикл
		
		Если Элемент.Документ.readyState <> "complete" Тогда
			Возврат;
		КонецЕсли;

		Команда = ТаблицаКоманд[0].Команда;
		Если Команда = "РаскрашиваемТекст" Тогда
			
			Элемент.Документ.body.innerHTML = ТаблицаКоманд[0].РаскрашенныйТекст;
			
		ИначеЕсли Команда = "ИзменитьСтили" Тогда

			// Получим стили HTML документа
			КоллекцияСтилей = Элемент.Документ.styleSheets;
			
			// Ситуация, когда стилей больше одного, не обрабатывается
			Если КоллекцияСтилей.length >= 1 Тогда 
				
				// Изменяем стиль на подготовленный
				Стили = КоллекцияСтилей.item(0);
				Стили.cssText = ВернутьСтиль();
						
			Иначе
						
				Если КоллекцияСтилей.length = 0 Тогда
					НовыйСтиль = Элемент.Документ.createStyleSheet(, 0);
					НовыйСтиль.cssText = ВернутьСтиль();
				КонецЕсли;
						
			КонецЕсли;
			
		КонецЕсли;
		
		ТаблицаКоманд.Удалить(0);
		
	КонецЦикла
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Счетчик = 1;
	
КонецПроцедуры

&НаКлиенте
Процедура СписокПриАктивизацииСтроки(Элемент)
	
	ТекущиеДанные = Элементы.Список.ТекущиеДанные;
	Если ТекущиеДанные <> Неопределено Тогда
		
		Если Не ТекущиеДанные.ЭтоГруппа Тогда
			Текст = ТекущиеДанные.Текст;	
		Иначе
			Текст = "";
		КонецЕсли; 
		
	Иначе
		
		Текст = "";
		
	КонецЕсли; 
	
	ВСтроке = Ложь; // глобальная для многострочных строк
	
	// Получаем HTML документ из объекта ПолеHTMLДокумента
	HTMLДокумент = Элементы.ПолеHTMLДокумента;
	
	Попытка
		
		РаскраситьТекст(Текст);
		ИзменитьСтили();
		
	Исключение          
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
	
	ПолеHTMLДокументаДокументСформирован(HTMLДокумент);
	
КонецПроцедуры

#КонецОбласти



