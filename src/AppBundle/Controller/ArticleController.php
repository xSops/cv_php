<?php

namespace AppBundle\Controller;
use AppBundle\Entity\Article;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;

class ArticleController extends Controller
{
    /**
     * @Route("/article", name="article")
     */
    public function addArticle(Request $request)

    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $form = $this->createFormBuilder()
            ->add('collection', TextType::class)
            ->add('title', TextType::class)
            ->add('contenu', TextareaType::class)

            ->add('submit', SubmitType::class)
            ->getForm();

        $form->handleRequest($request);
        if ($form->isValid()) {
            $data = $form->getData();



            $article = new Article();
            $article->setContenu($data['contenu']);
            $article->setCollection($data['collection']);
            $article->setTitle($data['title']);

            $em = $this->getDoctrine()->getManager();
            $em->persist($article);
            $em->flush();
            return $this->redirectToRoute('articles');

        }
        // replace this example code with whatever you need
        return $this->render('article/add.html.twig', ['form' => $form->createView()]);
    }


    /**
     * @Route("/", name="articles")
     */

    public function articleList (Request $request)
    {
        $repository = $this->getDoctrine()->getRepository('AppBundle:Article');
        $articles = $repository->findAll();

        $collections = $repository->getCollections();


        return $this->render('article/list.html.twig', ['articles'=>$articles, 'collections' => $collections]);
    }



    /**
     *@Route("/article/{id}", name="unArticle")
     */
    public function unarticleAction (Request $request, $id)
    {
        $repository = $this->getDoctrine()->getRepository('AppBundle:Article');
        $article = $repository->find($id);
        return $this->render('article/one.html.twig', ['article' => $article]);
    }

    /**
     *@Route("/article/remove/{id}", name="removeArticle")
     */
    public function removeArticle (Request $request, $id)
    {
       $this->denyAccessUnlessGranted(ROLE_ADMIN);

        $doctrine = $this->getDoctrine();
        $em = $doctrine->getManager();

        $repository = $doctrine->getRepository('AppBundle:Article');

        $article = $repository->find($id);
        $em->remove($article);
        $em->flush();

        return $this->redirectToRoute('articles');
    }
}