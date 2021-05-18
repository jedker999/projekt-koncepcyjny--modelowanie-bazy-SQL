# projekt-koncepcyjny--modelowanie-bazy

W ramach projektu należy:

1. zamodelować bazę odzwierciedlającą fragment rzeczywistości opisanej w jednym z poniższych tematów, w postaci diagramu ER, z wykorzystaniem wybranego narzędzia do projektowania, przekształcić diagramu do modelu relacyjnego (z uwzględnieniem kluczy obcych), stworzyć skrypt SQL zawierający polecenia CREATE TABLE oraz INSERT, który tworzy zaprojektowaną bazę i wypełnia ją przykładowymi wierszami.
2. Skrypt SQL powinien uruchamiać się w całości i wielokrotnie.
3. W poleceniach tworzących tabele należy skupić się na typach danych i ograniczeniach integralnościowych.
4. Wszystkie ograniczenia integralnościowe PRIMARY KEY, FOREIGN KEY, UNIQUE i CHECK muszą być nazwane poprzez CONSTRAINT (por. 05 – Polecenia DDL – Tabele – Tworzenie).
5. Do każdej tabeli należy wstawić przynajmniej 3-4 wiersze tak dobrane, aby prezentowały istotę problemu i demonstrowały wykorzystanie ograniczeń integralnościowych.



## System przeprowadzania testów

System pozwala umieszczać testy i zbierać wyniki testów użytkowników systemu. Dla ułatwienia zakładamy, że są to zawsze testy wielokrotnego wyboru. Każdy test ma swój unikalny numer, opis, datę utworzenia, opcjonalną datę wygaśnięcia, kategorię. W bazie pamiętane są pytania do testów - każde pytanie ma numer porządkowy unikalny w ramach danego testu, treść pytania i liczbę punktów. Test musi zawierać przynajmniej jedno pytanie. Każde pytanie musi mieć przynajmniej jedną odpowiedź, a odpowiedź musi być związana z jednym pytaniem. Każda odpowiedź opisana jest unikalnym kodem, treścią, oraz typem: poprawna/niepoprawna. System rejestruje uczestników. Każdy uczestnik ma unikalny login, imię, nazwisko, datę urodzenia, datę dodania do systemu. Uczestnicy biorą udział w testach. Każdy udział jest identyfikowany przez id, system pamięta ponadto datę przystąpienia danego uczestnika do danego testu oraz liczbę uzyskanych punktów. Pamiętana jest również informacja o tym, jakie odpowiedzi zostały wybrane przez danego uczestnika w ramach danego udziału w teście. W szczególności, uczestnik może brać wielokrotnie udział w danym teście.
