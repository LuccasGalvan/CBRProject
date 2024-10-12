function [journey, new_case] = revise(retrieved_cases, new_case, new_price)
    
    retrieved_codes = retrieved_cases{:,1};
    code = str2double('-');
        
    while isnan(code) || fix(code) ~= code || ismember(code, retrieved_codes) == 0
        fprintf('From the retrieved cases, which is the one that better matches your journey?\n');
        code = str2double(input('Journey Code: ','s'));
    end
    
    journey = fix(code);
    
    %revise price
    if new_price ~= -1 %flag se não houver preço / duração / num pessoas
        fprintf('\nUpdate your journey price with the new estimated value? (y/n)\n');
        option = input('Option: ', 's');

        if option == 'y' || option == 'Y'
            new_case.price = new_price;
        end
    else
        fprintf('\nWould you like to manually set your new journey price? (y/n)\n');
        option = input('Option: ', 's');

        if option == 'y' || option == 'Y'
            value = str2double('XD');
            while isnan(value)
                value = str2double(input('Insert new price for your journey: ', 's'));
            end
            new_case.price = value;
        end
    end

    %revise holiday type
    fprintf('\nUpdate your journey holiday type? (y/n)\n');
    option = input('Option: ', 's');

    if option == 'y' || option == 'Y'
        list = {'Active', 'Bathing', 'City', 'Education', 'Language', 'Recreation', 'Skiing', 'Wandering'};
        value = input('Insert new holiday type: ', 's');
        while ~ismember(list, value)
            value = input('Insert new holiday type: ', 's');
        end
        new_case.holiday_type = value;
    end

    %revise num_persons
    fprintf('\nUpdate your journey number of persons? (y/n)\n');
    option = input('Option: ', 's');

    if option == 'y' || option == 'Y'
        value = str2double('XD');
        while isnan(value)
            value = str2double(input('Insert new number of persons: ', 's'));
        end
        new_case.number_persons = value;
    end

    %revise transportation
    fprintf('\nUpdate your journey transportation method? (y/n)\n');
    option = input('Option: ', 's');

    if option == 'y' || option == 'Y'
        list = {'Car', 'Coach', 'Plane', 'Train'};
        value = input('Insert new transportation method: ', 's');
        while ~ismember(list, value)
            value = input('Insert new transportation method: ', 's');
        end
        new_case.holiday_type = value;
    end
        
    %terminar outros revises
end

