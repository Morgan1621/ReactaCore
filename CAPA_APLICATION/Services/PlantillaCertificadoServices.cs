using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class PlantillaCertificadoServices
    {


        private readonly IPantillaCertiRepository _RepositoryPlantillaCertificado;

        public PlantillaCertificadoServices(IPantillaCertiRepository repository)
        {
            _RepositoryPlantillaCertificado = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<PlantillaCertificadoDTOs>> ListarEvento()
        {
            var listar = await _RepositoryPlantillaCertificado.ListarPlantillaCertificadoAsync();

            return listar.Select(p => new PlantillaCertificadoDTOs
            {
                PlantillaId = p.PlantillaId,
                NombrePlantilla = p.NombrePlantilla,
                EstadoId = p.EstadoId,




            });
        }

        public async Task<IEnumerable<PlantillaCertificadoDTOs>> ListarNombreEvento(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<PlantillaCertificadoDTOs>();

            var lista = await _RepositoryPlantillaCertificado.ListarPlantillaCertificadoPorNombreAsync();

            return lista.Select(p => new PlantillaCertificadoDTOs
            {
                PlantillaId = p.PlantillaId,
                NombrePlantilla = p.NombrePlantilla,
                EstadoId = p.EstadoId,


            });

        }
    }
}
