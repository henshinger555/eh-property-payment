--Exports

--Global Variables


RegisterCommand('paypropertymenu', function()
    lib.registerContext({
        id = 'property+_pay_menu',
        title = 'Property Payment',
        options = {
            {
                title = 'Pay Properties',
                menu = 'payment_menu',
                description = 'Make payments for your properties',
            },
            {
                title = 'Payment Management',
                menu = 'payment_management',
                description = 'Make payments for your properties',
            },
        },
        {
            id = 'payment_menu',
            title = 'Payment for Properties',
            menu = 'property+_pay_menu',
            options = {
            {
                title = 'Property 1',
                description = 'Pink Cage #3',
                metadata = {
                    {label = 'Payment Ammount  :', value = 4000},
                    {label = 'Amount Remaining :', value = 'Rented'},
                },
                event = 'some_event',
                args = {property_id = 0}
            },
            {
                title = 'Property 2',
                description = 'Mirror Park House',
                metadata = {
                    {label = 'Payment Ammount  :', value = 40000},
                    {label = 'Amount Remaining :', value = 150000},
                    {label = '', progress = 50},
                },
                event = 'some_event',
                args = {property_id = 1}
            },
            }
        },
        {
            id = 'payment_management',
            title = 'Payment Management',
            menu = 'property+_pay_menu',
            options = {
                {
                    title = 'Current Clients',
                    menu = 'client_management',
                    description = 'Current list of Clients',
                },
                {
                    title = 'Funds Management',
                    menu = 'funds_management',
                    description = 'Manage Funds',
                    metadata = {
                        {label = 'Current Balance  :', value = 40000},
                    },
                },
                {
                    title = 'Manage Staff',
                    menu = 'staff_mangement',
                    description = 'Current list of Clients',
                },
            }
        },
        {
            id = 'client_management',
            title = 'Management for Clients',
            menu = 'property+_pay_menu',
            options = {
            {
                title = 'Cletus Finch',
                description = 'Pink Cage #3',
                metadata = {
                    {label = 'Payment Ammount  :', value = 4000},
                    {label = 'Amount Remaining :', value = 'Rented'},
                },
                event = 'some_event',
                args = {property_id = 0}
            },
            {
                title = 'Cobra Cobretti',
                description = 'Mirror Park House Address',
                metadata = {
                    {label = 'Payment Ammount  :', value = 40000},
                    {label = 'Amount Remaining :', value = 150000},
                },
                event = 'some_event',
                args = {property_id = 1}
            },
            }
        },
    })
    
    lib.showContext('payment_menu')
end)


RegisterCommand('testinput', function()
    local input = lib.inputDialog('Police locker', {
        { type = "input", label = "Locker number" },
        { type = "checkbox", label = "Some checkbox" },
        { type = "input", label = "Locker PIN", password = true, icon = 'lock' },
        { type = "checkbox", label = "Some other checkbox" },
        { type = 'select', label = 'Value select', options = {
            { value = 'option1', label = 'Option 1' },
            { value = 'option2', label = 'Option 2' },
            { value = 'option3', label = 'Option 3'},
        }}
    })
    print(json.encode(input, {indent=true}))

end)


RegisterCommand('testcontext', function()
    lib.registerContext({
        id = 'example_menu',
        title = 'Example Context',
        options = {
            {title = 'Empty button'},
            {
                title = 'Example button',
                description = 'Example button description',
                metadata = {
                    {label = 'Value 1', value = 'Some value'},
                    {label = 'Value 2', value = 300},
                }
            },
            {
                title = 'Menu button',
                menu = 'other_example_menu',
                description = 'Takes you to another menu!',
                metadata = {'It also has metadata support'}
            },
            {
                title = 'Event button',
                description = 'Open a menu and send event data',
                arrow = true,
                event = 'some_event',
                args = {value1 = 300, value2 = 'Other value'}
            }
        },
        {
            id = 'other_example_menu',
            title = 'Other Context Menu',
            menu = 'example_menu',
            options = {
                ['Nothing here'] = {}
            }
        }
    })
    lib.showContext('example_menu')
end)

RegisterNetEvent('some_event', function(parm1, parm2)

    print("Triggered some_event")
    print(json.encode(parm1, {indent=true}))

    
end)


