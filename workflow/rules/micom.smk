rule micom:
    input:
        models          = expand("results/gems/{mag}.xml", mag=MAGS)
    output:
        exchange_fluxes = "results/micom/exchange_fluxes.tsv"
    log:
        "logs/micom/micom.log"
    conda:
        "workflow/envs/micom.yaml"
    script:
        "workflow/scripts/micom.py"
        