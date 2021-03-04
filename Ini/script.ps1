<#
.SYNOPSIS
    Short work with ini files
#>

@"
; некоторый комментарий
# комментарий в стиле Unix

[Section1]
; комментарий о разделе
var1=значение_1 ; иногда допускается комментарий к отдельному параметру
var2=значение_2
  
[Section2] ; иногда допускается комментарий к отдельноой секции
var1=значение_1
var2=значение_2

; иногда позволяется перечислять несколько значений через запятую
[Section3]
var1=значение_1_1, значение_1_2, значение_1_3
var2=значение_2
; в Zend Framework массив задаётся следующим способом
[Section3.1]
var1[]=значение_1_1
var1[]=значение_1_2
var1[]=значение_1_3
var2=значение_2

; Иногда значения отсутствуют 
[Section4.0]
[ViewState]
Mode=
Vid=
FolderType=Generic
"@ | Out-File D:\tmp\example.ini

class Key{
   [int]$id
   [string]$key
   [string]$value
   [String]$inLineComment

   Key ($id, $key, $value){
      $this.id = $id
      $this.key = $key
      $this.value = $value
   }
}

class Comment {
   [int]$id
   [string]$value

   comment($id, $value){
      $this.id = $id 
      $this.value = $value
   }
}

class BlancLine{
   [int]$id

   blancLine($id){
      $this.id = $id
   }
}

class Section {
   [int]$Id
   [string]$Name
   [int]$ItemSequence
   [string]$inLineComment
   [System.Collections.Generic.List[key]]$Keys
   [System.Collections.Generic.List[comment]]$Comments
   [System.Collections.Generic.List[blancLine]]$BlancLines

   section($id, $name){
      $this.Id = $id
      $this.Name = $name
      $this.Keys = [System.Collections.Generic.List[key]]::new()
      $this.Comments = [System.Collections.Generic.List[comment]]::new()
      $this.BlancLines = [System.Collections.Generic.List[blancLine]]::new()
   }

   addComment([comment]$comment){
      $this.comments.Add($comment)
      $this.ItemSequence++
   }
}

class ini{
   [System.Collections.Generic.List[section]]$Sections
   hidden [int]$SectionsSequence

   ini([System.IO.FileInfo]$FileName){
      $this.Sections = [System.Collections.Generic.List[section]]::new()
      $this.AddSection([section]::new(0, "SectionNull"))
      Get-Content $FileName | ForEach-Object {
         if ($i = )
         switch -RegEx ($_) {
            "^\s*[;#].*" {
               $currentSection = $this.Sections[-1]
               $comment = [comment]::New($currentSection.ItemSequence, $_)
               $currentSection.addComment($comment)
            }
            "^\s*\[" {
               $this.AddSection([section]::new($this.SectionsSequence, $_))
            }
         Default {$null}
         }
      }
   }

   AddSection ([section]$section){
      $this.Sections.Add($section)
      $this.SectionsSequence++
   }
}

$iniInstance = [ini]::new('D:\tmp\example.ini')

$iniInstance.Sections