class LinkedList:
    
    def __init__(self):
        self.linked_list = []
    
    def get(self, index: int) -> int:
        if index >= len(self.linked_list):
            return -1
        return self.linked_list[index]

    def insertHead(self, val: int) -> None:
        self.linked_list = [val] + self.linked_list

    def insertTail(self, val: int) -> None:
        self.linked_list += [val]

    def remove(self, index: int) -> bool:
        if index >= len(self.linked_list):
            return False
        # remove element here
        new_list = [self.linked_list[i] for i, item in enumerate(self.linked_list) if i != index]
        self.linked_list = new_list
        return True

    def getValues(self) -> List[int]:
        return self.linked_list
        
