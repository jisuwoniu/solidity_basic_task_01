// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract Voting{

    //key为候选人名字，value为票数
    mapping(string=>uint256) public voteResult;
    string[] public votes  ;
    //一个vote函数，允许用户投票给某个候选人
    function vote(string memory name)external  {

        if (voteResult[name] == 0) {
            votes.push(name);
        }
        voteResult[name]+=1;
    }
    //一个getVotes函数，返回某个候选人的得票数
    function getVotes(string memory name) external view returns(uint256){
        return voteResult[name];
    }
    //一个resetVotes函数，重置所有候选人的得票数
    function resetVotes()external {
        for(uint256 index=0;index<votes.length; index++){
            delete voteResult[votes[index]];
        }
        delete votes;
    }
}