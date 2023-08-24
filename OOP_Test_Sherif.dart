class Book {
  String title;
  String author;
  int id;
  bool borrowed;
  bool upcoming;

  Book(this.title, this.author, this.id,this.upcoming) : borrowed = false ;

  void borrow() {
    if (!borrowed) {
      borrowed = true;
      print("Book '$title' has been borrowed ");
    } else {
      print("$title is already borrowed");
    }
  }

  void returnBook() {
    if (borrowed) {
      borrowed = false;
      print("Book '$title' has been returned");
    } else {
      print("$title is not borrowed");
    }
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void BookList() {
    int i = 0;
    print("Books List :");
    for (var book in books) {
      i++;
      print("$i-  ${book.title}");
    }
    print("----------------------------------------------");
  }

  void borrowBook(int bookId) {
    var book = books.firstWhere((book) => book.id == bookId);
    if (book != null) {
      if (!book.borrowed && !book.upcoming) {
        book.borrow();
      } else if(!book.borrowed && book.upcoming){
        print("${book.title} is upcoming");
      }
      else {
        print("${book.title} is already borrowed");
      }
    } else {
      print("Book not found");
    }
  }

  void returnBook(int bookId) {
    var book = books.firstWhere((book) => book.id == bookId);
    if (book != null) {
      if (book.borrowed) {
        book.returnBook();
      } else {
        print("${book.title} is not borrowed ");
      }
    } else {
      print("Book not found");
    }
  }

  bool isBookAvailable(int bookId) {
    var book = books.firstWhere((book) => book.id == bookId);
    return book != null && !book.borrowed;
  }
}

void main () {
  int bookId = 2; 
  Library lib = new Library();
  
  var book1 = Book("The art of not giving a f**k", "Mark", 1,false);
  var book2 = Book("Living with physcopaths", "a pyhsco man", 2,false);
  var book3 = Book("As a Man Thinketh ", "james allen", 3,true);

  
  lib.addBook(book1);
  lib.addBook(book2);
  lib.addBook(book3);

  lib.BookList();
  lib.borrowBook(3);
  lib.returnBook(1);
  lib.borrowBook(2);
  lib.returnBook(2);

 var book = lib.books.firstWhere((book) => book.id == bookId);
if (!book.borrowed && !book.upcoming){
  print("Book ${book.title} is available for borrowing");
  
}
  else {print("Book ${book.title} is not available for borrowing");}
}



