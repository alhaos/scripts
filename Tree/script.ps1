<#
    .Description
    BinaryTree Class    
#>

class TreeNode {

    [int]$ID
    [System.Nullable[int]]$ParentNodeId
    [int]$level
    [string]$Tag

    TreeNode ($id, $parentNodeId, $level) {
        $this.ID = $id
        $this.ParentNodeId = $parentNodeId
        $this.level = $level
    }
 }

 class binaryTree {
    [TreeNode[]]$Nodes
    hidden [int]$SequenceNextNodeId = 0

    BinaryTree() {
        $this.Nodes +=, [TreeNode]::New($this.SequenceNextNodeId, $null, 0)
        $this.SequenceNextNodeId++
    }

    InsertNode($parentNodeId) {
        $node = [TreeNode]::New($this.SequenceNextNodeId, $parentNodeId, $level)
        $this.Nodes +=, $node
        $this.SequenceNextNodeId++
    }
}

$myBinaryTree = [binaryTree]::New()
$myBinaryTree.InsertNode(0)
$myBinaryTree.Nodes
