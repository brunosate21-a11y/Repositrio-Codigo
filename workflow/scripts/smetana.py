__author__ = "Bruno Ferreira"
__license__ = "MIT"

import sys
from pathlib import Path
from snakemake.shell import shell

models = snakemake.input.models
global_out = snakemake.output.global_scores
detailed_out = snakemake.output.detailed
solver = snakemake.params.get("solver", "scip")   # ← scip por defeito

if isinstance(models, str):
    models_str = models
else:
    models_str = " ".join(models)

smetana_bin = Path(sys.executable).parent / "Scripts" / "smetana"

log = snakemake.log_fmt_shell(stdout=True, stderr=True)

shell(
    f"python {smetana_bin} {{models_str}} "
    "-g "
    "--solver {solver} "
    "-o {global_out} "
    "{log}"
)

log_append = log.replace(">", ">>", 1) if ">" in log else log
shell(
    f"python {smetana_bin} {{models_str}} "
    "-d "
    "--solver {solver} "
    "-o {detailed_out} "
    f"{log_append}"
)