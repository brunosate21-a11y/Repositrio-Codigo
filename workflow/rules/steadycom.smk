rule steadycom:
    input:
        models     = expand("results/gems/{mag}.xml", mag=MAGS)
    output:
        abundances = "results/steadycom/abundances.tsv"
    log:
        "logs/steadycom/steadycom.log"
    conda:
        "workflow/envs/steadycom.yaml"
    script:
        "workflow/scripts/steadycom.py"
        