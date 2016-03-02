class TodoList
    # methods and stuff go here
    attr_reader :title, :items
    def initialize(list_title)
       @title = list_title
       @items = Array.new #Starts as empty Array
    end
    #overrides the to string so that puts calls this method
    def to_s
      final_str =  "------------------------------------------------------------------------------\n"\
        <<@title.ljust(62)<<Time.now().strftime("%d/%m/%Y %H:%M")<<\
        "\n------------------------------------------------------------------------------\n"\
        <<" I |     Description       | Creation Date| Due Date |P|Perc|Completion Status\n"\
        <<"------------------------------------------------------------------------------\n"
        index = 1
        @items.each do |item|
           final_str << (index.to_s+". ").ljust(5)<< item.print_item
           index+=1
        end
        final_str+"\n*P represents priority(1 to 5) and Perc is the percentage of completion."
    end
    def print_to_file()
      report_file = File.new("TextTodoList.txt", "w+")
      report_file.puts to_s
      report_file.close()
    end
    def sort_by_completion_status_t()
      completed_items=Array.new
      incomplete_items=Array.new
      @items.each do |item|
         if (item.is_completed? == true)
           completed_items.push(item)
         else
           incomplete_items.push(item)
         end
      end
      @items = nil
      @items=completed_items
      @items+=incomplete_items
    end
    def sort_by_completion_status_f()
      completed_items=Array.new
      incomplete_items=Array.new
      @items.each do |item|
         if (item.is_completed? == true)
           completed_items.push(item)
         else
           incomplete_items.push(item)
         end
      end
      @items = nil
      @items=incomplete_items
      @items+=completed_items
    end
    def sort_by_percentage()
      @items.sort! { |a,b| a.percentage <=> b.percentage }
    end
    def sort_alphabetically()
      @items.sort! { |a,b| a.description.downcase <=> b.description.downcase }
    end
    def sort_by_priority()
      p5=Array.new
      p4=Array.new
      p3=Array.new
      p2=Array.new
      p1=Array.new
      p0=Array.new

      @items.each do |item|
         if(item.item_priority()==5)
           p5.push(item)
         elsif (item.item_priority()==4)
           p4.push(item)
         elsif (item.item_priority()==3)
           p3.push(item)
         elsif (item.item_priority()==2)
           p2.push(item)
         elsif (item.item_priority()==1)
           p1.push(item)
         else
           p0.push(item)
         end
       end
         @items=nil
         @items=p5
         @items+=p4
         @items+=p3
         @items+=p2
         @items+=p1
         @items+=p0
    end
    def list_completed()
      @items.each { |item| item.task_completed }
    end
    def rename_list(new_name)
      @title = new_name
    end

    def add_item(new_item, options = {})
      priority=options[:tag] ||5
      item = Item.new(new_item,priority)
      @items.push(item)
    end

    def delete_item_at(index)
      @items.delete_at(index)
    end
    def rename_item_at(description, index)
      @items[index].rename_item(description)
    end
end

class Item
     attr_reader :percentage, :description, :item_priority, :item_due_date

     # Initialize item with a description and marked as
     # not complete
     def initialize(item_description, due_date= "" , priority)
        @description = item_description
        @completed_status = false
        @creation_date = Time.now()#initializes creation date to now
        @item_due_date = due_date
        @item_priority =priority#if undifined item has highest priority
        @percentage = 0
     end
     def rename_item(new_name)
       @description = new_name
     end
     def set_percentage(new_percentage)
       if new_percentage == 100
         task_completed()
       elsif new_percentage < 100 && new_percentage > 0
         @percentage=new_percentage
       end
     end
     #this methods only returns the date and not the time
     def creation_date()
       @creation_date.strftime("%d/%m/%Y")
     end
     #this method marks a task as completed
     def task_completed()
       @completed_status = true
       @item_priority = 0
       @percentage=100
     end
     def item_priority()
       @item_priority
     end
     def is_completed?()
       @completed_status
     end
     def set_item_priority(new_priority)
       if new_priority <= 5 && new_priority > 0
         @item_priority = new_priority
       end
     end
     def set_due_date(due_date)
       @item_due_date = due_date
     end
     def print_item()
       @description.ljust(25)<<creation_date.ljust(12)<<\
       @item_due_date.ljust(12)<<@item_priority.to_s.ljust(2)<<\
       (@percentage.to_s+"%").ljust(5)<<\
       "completed: "<< is_completed?.to_s<<"  \n"
     end

end
