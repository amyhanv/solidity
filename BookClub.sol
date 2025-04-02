// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

// Rules:
// - One can only borrow 1 book at a time
// - A book may not be borrowed by two people
// - Book id is book index

contract Library {

    struct Book {
        string title;
        string authorName;
        bool isBorrowed;
        uint256 price;
    }
    
    Book[] books;

    struct Person {
        address borrowerAddress;
        string name;
    }
 
    Person[] borrowers;

    mapping(address => uint256) public borrowerToBook; // address => 12345

    constructor() {
        addBook("The Lord of the Rings", "J.R. Tolkien", 30);
        addBook("Harry Potter", "J.K Rowling", 45);
        addMember(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Sean Clair");
    }


    function addBook(string memory _title, string memory _authorName, uint256 _price ) public {
       books.push(Book(_title, _authorName, false, _price));
    }

    function borrowBook(address _memberAddress, uint256 _bookID) public {
        // Make sure member does not have borrowed book already
        require(borrowerToBook[_memberAddress] == type(uint256).max, "You're already borrowing a book.");

        // Check if book exists
        require(_bookID < books.length, "Book does not exist.");

        // Check if it is already borrowed
        require(books[_bookID].isBorrowed == false, "Book is already borrowed.");

        // Perform borrowing updates
        books[_bookID].isBorrowed = true;
        borrowerToBook[_memberAddress] = _bookID;
    }


    function addMember(address _memberAddress, string memory _name) public {
        borrowers.push(Person(_memberAddress, _name));
        borrowerToBook[_memberAddress] = type(uint256).max;
    }

    function returnBook(address _borrowerAddress) public {
        uint256 borrowedBookID = borrowerToBook[_borrowerAddress];

        // Check if borrower has a book to return
        require(borrowedBookID != type(uint256).max, "You're not borrowing a book.");

        // Perform returning updates
        books[borrowedBookID].isBorrowed = false;
        borrowerToBook[_borrowerAddress] = type(uint256).max;

    }

    function getBookStatus(uint256 _bookID) public view returns (bool) {
        return books[_bookID].isBorrowed;
    }

    function viewMembers() public view returns (Person[] memory) {
        return borrowers;
    }

    function getMembersBook(address _member) public view returns (uint256) {
        return borrowerToBook[_member];
    }

    function viewAvailableBooks() public view returns (Book[] memory) {
        uint count = 0;
        for (uint i = 0; i < books.length; i++) {
            if (!books[i].isBorrowed) {
                count++;
            }
        }

        Book[] memory availableBooks = new Book[](count);
        uint index = 0;

        for (uint i = 0; i < books.length; i++) {
            if (!books[i].isBorrowed) {
                availableBooks[index] = books[i];
                index++;
            }
        }

        return availableBooks;
    }


}