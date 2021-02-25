#To run test:
# Invoke-Pester .\New-ResourceGroup_test.ps1

Describe "New-ResourceGroup"{
    $location='eastus2'
    $name='cloudskillbootcamp'

    It "Name should be cloudskillbootcamp"{
        $name|Should Be 'cloudskillbootcamp'
    }

    It "location should be eastus"{
        $location|Should Be 'eastus2'
    }
}