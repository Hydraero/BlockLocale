# BlockLocale by Richard Tumaneng for CMPE 183

___


## Technologies Used

This project was created using React, JavaScript, CSS, and HTML for the front end. Solidity was used in the backend to write the smart contracts to enable voting and polling functionalities.

### Front End

- React
- JavaScript
- CSS
- HTML

### Back End

- Solidity - Used to write the Smart Contract
- Truffle - Used to as a testing framework to test the smart contract using generated accounts
- Ganache - Used as a desktop application to generate the crypto wallets 
- Remix - Used to test the smart contract through Ethereum's own browser IDE

## How to run the Application

To run this program make sure dependencies are installed first using a package manager like Node.js 

(use `npm install`). 

First use:

`truffle migrate --reset`

to migrate the project.

then use:

`npm run dev` 

to run the program. The application should appear on http://localhost:3000/

## How to run the tests & current unit tests
The application can be tested using the Truffle framework in conjunction with Ganache. First have Ganache running to allow for testing, then run: 
`truffle test` 
on the main directory to run the unit test. Tests are located in the "test" directory under election.js

Currently the unit tests on this application include:
- Tests that an election intitiates with 0 total votes to ensure no 
- Tests that the election intitiates with 2 candidates.
- Tests that the two candidates are initiated with corrects values. This means candidates ID's start at 1 & 2 respectively and both intitate with 0 votes each.


