import ApprovalVoting from 0x01cf0e2f2f715450

// This transaction allows a voter to select the votes they would like to make
// and cast that vote by using the castVote function 
// of the ApprovalVoting smart contract

transaction {
    prepare(voter: AuthAccount) {
        
        // take the voter's ballot our of storage
        let ballot <- voter.load<@ApprovalVoting.Ballot>(from: /storage/Ballot)!

        // Vote on the proposal 
        // TODO check if the proposal can vote for signees 
        ballot.vote(proposal: 1)

        // Cast the vote by submitting it to the smart contract
        ApprovalVoting.cast(ballot: <-ballot)

        log("Vote cast and tallied")
    }
}
