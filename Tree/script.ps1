<#
    .Description
    BinaryTree Class    
#>

class TreeNode {

    [int]$ID
    [System.Nullable[int]]$ParentNodeId
    [string]$Tag

    TreeNode ($id, $parentNodeId) {
        $this.ID = $id
        $this.parentNodeId = $parentNodeId
    }
 }

 class binaryTree {
    [TreeNode[]]$Nodes
    hidden [int]$SequenceNextNodeId = 0

    BinaryTree() {
        $this.Nodes +=, [TreeNode]::New($this.SequenceNextNodeId, $null)
        $this.SequenceNextNodeId++
    }

    InsertNode($parentNodeId) {
        $node = [TreeNode]::New($this.SequenceNextNodeId, $parentNodeId)
        $this.Nodes +=, $node
        $this.SequenceNextNodeId++
    }
}

$myBinaryTree = [binaryTree]::New()
$myBinaryTree.InsertNode(0)
$myBinaryTree.InsertNode(1)
$myBinaryTree.InsertNode(0)


$myBinaryTree.Nodes
