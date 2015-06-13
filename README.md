Event_Reporter
==============

A small Ruby project to use and understand REPLs; 4 weeks into my coding career.

Project Overview
Learning & Practice Goals

    Become comfortable with implementing basic classes and methods
    Demonstrate understanding of variable scope and lifecycle
    Create multiple coordinating methods and objects
    Use default and named parameters
    Utilize effective debugging techniques

Abstract

Build an interactive query and reporting tool which fulfills the expectations below. Re-use data cleaning procedures from the original EventManager (http://tutorials.jumpstartlab.com/projects/eventmanager.html) to handle dirty input and generate beautiful output.

Data Supplied

    Source data file: event_attendees.csv

Base Expectations

As a user launching the program, I’m provided a REPL where I can issue one of several commands, described below. After each command completes, the prompt returns, waiting for another instruction.

The Queue

The program has a concept called the "queue". The queue holds the stored results from a previous search. As a user, I issue a search command to find records, then later issue another command to do work with those results. The queue is not cleared until the user runs the command queue clear or a new find command.
The REPL

The program must respond to the following commands:
load <filename>

Erase any loaded data and parse the specified file. If no filename is given, default to event_attendees.csv.
help

Output a listing of the available individual commands
help <command>

Output a description of how to use the specific command. For example:

1
2

	

help queue clear
help find

queue count

Output how many records are in the current queue
queue clear

Empty the queue
queue print

Print out a tab-delimited data table with a header row following this format:

1

	

  LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE

queue print by <attribute>

Print the data table sorted by the specified attribute like zipcode.
queue save to <filename.csv>

Export the current queue to the specified filename as a CSV. The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number.
find <attribute> <criteria>

Load the queue with all records matching the criteria for the given attribute. Example usages:

    find zipcode 20011
    find last_name Johnson
    find state VA

The comparison should:

    Be case insensitive, so "Mary" and "mary" would be found in the same search
    Be insensitive to internal whitespace, but not external:
        "John" and "John " are considered matches
        "John Paul" and "Johnpaul" are not matches
    Not do substring matches, so a find first_name Mary does not find a record with first name "marybeth"
