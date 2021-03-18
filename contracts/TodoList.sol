// SPDX-License-Identifier: aes
pragma solidity >=0.6.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event StatusToggled(
        uint id,
        bool completed
    );

    constructor() {
        createTask("First task created by the constructor!");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);

        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory task = getTask(_id);
        task.completed = !task.completed;
        
        tasks[_id] = task;

        emit StatusToggled(_id, task.completed);
    }

    function getTask(uint _id) view internal returns(Task memory ) {
        return tasks[_id];
    }

}