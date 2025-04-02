package be.iccbxl.poo.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    private UUID id;
    private String title;
    private String author;
    private short totalPages;
    private byte loadPeriod;
    private double rentalPrice;
    private Language language;
    private short nbCopies;
    private boolean borrowable;
    private ArrayList<Person> borrowers = new ArrayList<>();
    private String isbn;

    public Book(UUID id, String title, String author, short totalPages, byte loadPeriod, double rentalPrice, Language language, short nbCopies, boolean borrowable, ArrayList<Person> borrowers) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.totalPages = totalPages;
        this.loadPeriod = loadPeriod;
        this.rentalPrice = rentalPrice;
        this.language = language;
        this.nbCopies = nbCopies;
        this.borrowable = borrowable;
        this.borrowers = borrowers;
    }

    public Book(String title, String author, short totalPages) {
        this(UUID.randomUUID(), title, author,(short) totalPages,(byte)7,1.0,Language.FR,(short) 1,true,new ArrayList<Person>());
    }

    public Book(UUID id, String title, String author, String isbn) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.isbn = isbn;
        this.totalPages = 0; // Valeur par défaut
        this.loadPeriod = 7; // Valeur par défaut
        this.rentalPrice = 0.0; // Valeur par défaut
        this.language = Language.FR; // Valeur par défaut
        this.nbCopies = 1; // Valeur par défaut
        this.borrowable = true; // Valeur par défaut
        this.borrowers = new ArrayList<>(); // Liste vide par défaut
    }

    public LocalDate computeReturnDate() {
        //TODO
        return null;
    }
}
