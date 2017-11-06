module DynamodbModel
  class Migration
    autoload :Dsl, "dynamodb_model/migration/dsl"
    autoload :Generator, "dynamodb_model/migration/generator"

    def up
      puts "Should defined an up method for your migration: #{self.class.name}"
    end

    def create_table(table_name, &block)
      execute_with_dsl_params(:create_table, table_name, &block)
    end

    def update_table(table_name, &block)
      execute_with_dsl_params(:update_table, table_name, &block)
    end

  private
    def execute_with_dsl_params(method_name, table_name)
      dsl = Dsl.new(method_name, table_name)
      params = dsl.params
      # executor = DslExecutor.new(method_name, params)
      # executor.run
      # dsl.execute(method_name)
    end
  end
end
