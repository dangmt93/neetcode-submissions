class Solution:
    def groupAnagrams(self, strs: list[str]) -> list[list[str]]:
        if len(strs) == 1:
            return [[strs[0]]]
        
        anagramGroups: dict[str, list[str]] = {}

        for string in strs:
            sortedString = "".join(sorted(string))

            # Directly check and add to dictionary in O(1) time
            if sortedString in anagramGroups:
                anagramGroups[sortedString].append(string)
            else:
                anagramGroups[sortedString] = [string]

        return [group for group in anagramGroups.values()]