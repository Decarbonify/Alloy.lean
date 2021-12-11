import Lake
open Lake DSL System

package alloy {
  supportInterpreter := true
}

script examples do
  let alloyLib := FilePath.mk "build" / "lib"
  let alloyPath := FilePath.mk "build" / "bin" / "alloy"
  let alloy ← IO.Process.spawn {
    cmd := alloyPath.withExtension FilePath.exeExtension |>.toString
    args := #[FilePath.mk "examples" / "my_add.lean" |>.toString]
    env := #[("LEAN_PATH", SearchPath.toString [alloyLib])]
  }
  alloy.wait
