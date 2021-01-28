extends Component
class_name KitConstructor




func constructEntByDictionary(tempdict:Dictionary) -> KitEntity:
	var ent = KitE.new()
	ent.layer = Comp_Tile_Layer.new(tempdict["Comp_Tile_Layer"])
	ent.isWalkable = Comp_Tile_IsWalkable.new(tempdict["Comp_Tile_IsWalkable"])
	ent.textureID = Comp_Tile_TextureID.new(tempdict["Comp_Tile_TextureID"])
	ent.tileName = Comp_Tile_Name.new(tempdict["Comp_Tile_Name"])
	ent.description = Comp_Tile_Description.new(tempdict["Comp_Tile_Description"])
	ent.magicNoise = Comp_Tile_MagicNoise.new(tempdict["Comp_Tile_MagicNoise"])
	ent.matrixNoise = Comp_Tile_MatrixNoise.new(tempdict["Comp_Tile_MatrixNoise"])
	ent.connect("TileEntity_Validate_Use",ent,"_On_TileEntity_Validate_Use")
	return ent


func constructEntByEnt(arrOfEnt:Array) -> KitEntity:
	var ent = KitE.new()
	ent.layer = Comp_Tile_Layer.new(tempdict["Comp_Tile_Layer"])
	ent.isWalkable = Comp_Tile_IsWalkable.new(tempdict["Comp_Tile_IsWalkable"])
	ent.textureID = Comp_Tile_TextureID.new(tempdict["Comp_Tile_TextureID"])
	ent.tileName = Comp_Tile_Name.new(tempdict["Comp_Tile_Name"])
	ent.description = Comp_Tile_Description.new(tempdict["Comp_Tile_Description"])
	ent.magicNoise = Comp_Tile_MagicNoise.new(tempdict["Comp_Tile_MagicNoise"])
	ent.matrixNoise = Comp_Tile_MatrixNoise.new(tempdict["Comp_Tile_MatrixNoise"])
	ent.connect("TileEntity_Validate_Use",ent,"_On_TileEntity_Validate_Use")
	return ent
