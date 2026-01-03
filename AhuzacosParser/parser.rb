require 'pp'

## Specifies where to find the file to interpret.
#$:.unshift File.dirname(__FILE__) + "/../lib"

require 'parslet'

include Parslet

# File extension is .azu

class GBCLParser < Parslet::Parser
  # Use .maybe on fdl so the very last line doesn't require a newline
  rule :literals do
    (literal >> fdl.maybe).repeat >> eof
  end

  rule :literal do
    # We use espace.maybe here so a trailing space isn't mandatory
    affirm_root.as(:literal) >> espace.maybe 
  end

  rule(:affirm_root) {
    affirm.as(:affirmation) >> lparen >> 
    cette_head.as(:cette_head) >> lparen >> cette_arg.as(:first_cette) >> comma >> espace >> cette_arg.as(:second_cette) >> rparen >> comma >> espace >>
    maisette_head.as(:maisette_head) >> lparen >> maisette_arg.as(:first_maisette) >> comma >> espace >> maisette_arg.as(:second_maisette) >> rparen >> comma >> espace >>
    sinon_head.as(:sinon_head) >> lparen >> sinon_arg.as(:first_sinon) >> comma >> espace >> sinon_arg.as(:second_sinon) >> comma >> espace >>
    sinon_arg.as(:third_sinon) >> comma >> espace >> sinon_arg.as(:fourth_sinon) >> rparen >> rparen >> period
  }

  # --- Reserved Lexical Rules ---
  rule(:lparen) { str("(") }
  rule(:rparen) { str(")") }
  rule(:comma)  { str(",") }
  rule(:period) { str(".") }
  
  # If this is "Reserved", it usually means 1 or more. 
  # We handle the "optional" part in the literal rule above.
  rule(:espace) { match('\s').repeat(1) }
  
  rule(:fdl)    { match('[\r\n]').repeat(1) }
  rule(:eof)    { any.absent? }

  # --- Keywords ---
  rule(:affirm)        { str("affirm") }
  rule(:cette_head)    { str("cette") }
  rule(:maisette_head) { str("maisette") }
  rule(:sinon_head)    { str("sinon") }

  # --- Args ---
  rule(:cette_arg)    { match['A-Za-z'].repeat(1) }
  rule(:maisette_arg) { match['A-Za-z'].repeat(1) }
  rule(:sinon_arg)    { match['A-Za-z'].repeat(1) }

  root :literals
end

class GBCLTransform < Parslet::Transform
  rule(:lparen => simple(:lparen)) { nil }
  rule(:rparen => simple(:rparen)) { nil }
  rule(:comma  => simple(:comma))  { nil }
  rule(:espace => simple(:espace)) { nil }

  rule(:affirm) { "affirm" }
  
  rule(:cette_head)    {    "cette" }
  rule(:maisette_head) { "maisette" }
  rule(:sinon_head)    {    "sinon" }
    
  rule(:cette_arg    => simple(:cette_org))    {    cette_arg }
  rule(:maisette_arg => simple(:maisette_org)) { maisette_arg }
  rule(:sinon_arg    => simple(:sinon_org))    {    sinon_arg }
end

parser    = GBCLParser.new
transform = GBCLTransform.new

begin
  assert1 = "affirm(cette(pomme, rouge), maisette(pomme, vert), sinon(pomme, rouge, vert, jaune))."
  assert2 = "affirm(cette(pomme, vert), maisette(pomme, rouge), sinon(pomme, vert, rouge, jaune))."
  assert3 = "affirm(cette(pomme, jaune), maisette(pomme, rouge), sinon(pomme, jaune, vert, rouge))."
    
  ast1         = transform.apply(assert1)
  ast2         = transform.apply(assert2)
  ast3         = transform.apply(assert3)

  require "NeoPathfinding"

  2.times do
    get_statistics(:first_abstract_syntax,  sabofensu(ast1),
                   :second_abstract_syntax, sabofensu(ast2),
                   :third_abstract_syntax,  sabofensu(ast3))
                     
                   dynamic_reward_allocation
                   thresholding($current_probability, 12, 12)
  end
    
  clean_output1 = GBCLTransform.new.apply(ast1)
  clean_output2 = GBCLTransform.new.apply(ast2)
  clean_output3 = GBCLTransform.new.apply(ast3)

  2.times do
    get_statistics(:first_abstract_syntax,  nesabofensu(ast1),
                   :second_abstract_syntax, nesabofensu(ast2),
                   :third_abstract_syntax,  nesabofensu(ast3))
                     
                   dynamic_reward_allocation
                   thresholding($current_probability, 12, 12)
  end
    
  clean_output1 = GBCLTransform.new.apply(ast1)
  clean_output2 = GBCLTransform.new.apply(ast2)
  clean_output3 = GBCLTransform.new.apply(ast3)
rescue Parslet::ParseFailed => error
  puts error.parse_failure_cause.ascii_tree
end
