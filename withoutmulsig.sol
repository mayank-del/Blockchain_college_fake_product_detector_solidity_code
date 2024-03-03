pragma solidity ^0.8.0;

contract DataStorage {
    struct Data {
        uint256 id;
        string data;
    }

    mapping(uint256 => Data) public datas;

    event DataAdded(uint256 id, string data);
    event DataUpdated(uint256 id, string data);

    function addData(uint256 id, string memory _data) public {
        datas[id] = Data(id, _data);
        emit DataAdded(id, _data);
    }

    function updateData(uint256 id, string memory _data) public {
        require(datas[id].id != 0, "Data does not exist");
        datas[id].data = _data;
        emit DataUpdated(id, _data);
    }

    function getData(uint256 id) public view returns (uint256, string memory) {
        require(datas[id].id != 0, "Data does not exist");
        return (datas[id].id, datas[id].data);
    }
}
