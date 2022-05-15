# BlockLocale by Richard Tumaneng for CMPE 183

## How to run the program
To run this program make sure dependencies are installed first (use "npm install"). First use "truffle migrate --reset" to migrate the project, then use "npm run dev" to run the program. The application should appear on http://localhost:3000/

## How to run the tests & current unit tests
The application can be tested using the Truffle framework in conjunction with Ganache. First have Ganache running to allow for testing, then run "truffle test" on the main directory to run the unit test. Tests are located in the "test" directory under election.js

Currently the unit tests on this application include:
- Tests that an election intitiates with 0 total votes to ensure no 
- Tests that the election intitiates with 2 candidates.
- Tests that the two candidates are initiated with corrects values. This means candidates ID's start at 1 & 2 respectively and both intitate with 0 votes each.


