<#
    .Description
    BinaryTree Class    
#>

class binaryTreeNode {

    [int]$id
    [int]$leftChildId
    [int]$rightChildId
    [string]$tag

    binaryTreeNode ($id) {
        $this.id = $id
    }
    
}

class binaryTree {
    [binaryTreeNode[]]$nodes
    [int]$sequenceNextNodeId = 0

    binaryTree() { # констуктор
        $this.nodes +=, [binaryTreeNode]::New($this.sequenceNextNodeId)
        $this.sequenceNextNodeId++
    }

    insertLeftChild($nodeID) {
        $this.nodes +=, [binaryTreeNode]::New($this.sequenceNextNodeId)
        for ($i = 0; $i -lt $this.sequenceNextNodeId; $i++){
            if ($this.nodes[$i].id -eq $nodeID){
                $this.nodes[$i].leftChildId = $this.sequenceNextNodeId
            }
        }
        $this.sequenceNextNodeId++
    }

    insertRightChild($nodeID) {
        $this.nodes +=, [binaryTreeNode]::New($this.sequenceNextNodeId)
        for ($i = 0; $i -lt $this.sequenceNextNodeId; $i++){
            $this.sequenceNextNodeId[$i]
            if ($this.nodes[$i].id -eq $nodeID){
                $this.nodes[$i].rightChildId = $this.sequenceNextNodeId
            }
        }
        $this.sequenceNextNodeId++
    }
}

$myBinaryTree = [binaryTree]::New()
$myBinaryTree.insertLeftChild(0)
$myBinaryTree.insertRightChild(0)
$myBinaryTree.insertRightChild(2)

$myBinaryTree.nodes
